/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 本软件已申请软件著作权，受国家版权局知识产权以及国家计算机软件著作权保护！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2019-2021 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package ltd.pchardware.mall.service.impl;

import ltd.pchardware.mall.api.mall.param.SaveCartItemParam;
import ltd.pchardware.mall.api.mall.param.UpdateCartItemParam;
import ltd.pchardware.mall.common.Constants;
import ltd.pchardware.mall.common.MallException;
import ltd.pchardware.mall.common.ServiceResultEnum;
import ltd.pchardware.mall.api.mall.vo.NewBeeMallShoppingCartItemVO;
import ltd.pchardware.mall.dao.MallGoodsMapper;
import ltd.pchardware.mall.dao.MallShoppingCartItemMapper;
import ltd.pchardware.mall.entity.MallGoods;
import ltd.pchardware.mall.entity.MallShoppingCartItem;
import ltd.pchardware.mall.service.MallShoppingCartService;
import ltd.pchardware.mall.util.BeanUtil;
import ltd.pchardware.mall.util.PageQueryUtil;
import ltd.pchardware.mall.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class MallShoppingCartServiceImpl implements MallShoppingCartService {

    @Autowired
    private MallShoppingCartItemMapper mallShoppingCartItemMapper;

    @Autowired
    private MallGoodsMapper mallGoodsMapper;

    @Override
    public String saveNewBeeMallCartItem(SaveCartItemParam saveCartItemParam, Long userId) {
        MallShoppingCartItem temp = mallShoppingCartItemMapper.selectByUserIdAndGoodsId(userId, saveCartItemParam.getGoodsId());
        if (temp != null) {
            //已存在则修改该记录
            MallException.fail(ServiceResultEnum.SHOPPING_CART_ITEM_EXIST_ERROR.getResult());
        }
        MallGoods mallGoods = mallGoodsMapper.selectByPrimaryKey(saveCartItemParam.getGoodsId());
        //商品为空
        if (mallGoods == null) {
            return ServiceResultEnum.GOODS_NOT_EXIST.getResult();
        }
        int totalItem = mallShoppingCartItemMapper.selectCountByUserId(userId);
        //超出单个商品的最小数量
        if (saveCartItemParam.getGoodsCount() < 1) {
            return ServiceResultEnum.SHOPPING_CART_ITEM_NUMBER_ERROR.getResult();
        }
        //超出单个商品的最大数量
        if (saveCartItemParam.getGoodsCount() > Constants.SHOPPING_CART_ITEM_LIMIT_NUMBER) {
            return ServiceResultEnum.SHOPPING_CART_ITEM_LIMIT_NUMBER_ERROR.getResult();
        }
        //超出最大数量
        if (totalItem > Constants.SHOPPING_CART_ITEM_TOTAL_NUMBER) {
            return ServiceResultEnum.SHOPPING_CART_ITEM_TOTAL_NUMBER_ERROR.getResult();
        }
        MallShoppingCartItem mallShoppingCartItem = new MallShoppingCartItem();
        BeanUtil.copyProperties(saveCartItemParam, mallShoppingCartItem);
        mallShoppingCartItem.setUserId(userId);
        //保存记录
        if (mallShoppingCartItemMapper.insertSelective(mallShoppingCartItem) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public String updateNewBeeMallCartItem(UpdateCartItemParam updateCartItemParam, Long userId) {
        MallShoppingCartItem mallShoppingCartItemUpdate = mallShoppingCartItemMapper.selectByPrimaryKey(updateCartItemParam.getCartItemId());
        if (mallShoppingCartItemUpdate == null) {
            return ServiceResultEnum.DATA_NOT_EXIST.getResult();
        }
        if (!mallShoppingCartItemUpdate.getUserId().equals(userId)) {
            MallException.fail(ServiceResultEnum.REQUEST_FORBIDEN_ERROR.getResult());
        }
        //超出单个商品的最大数量
        if (updateCartItemParam.getGoodsCount() > Constants.SHOPPING_CART_ITEM_LIMIT_NUMBER) {
            return ServiceResultEnum.SHOPPING_CART_ITEM_LIMIT_NUMBER_ERROR.getResult();
        }
        //当前登录账号的userId与待修改的cartItem中userId不同，返回错误
        if (!mallShoppingCartItemUpdate.getUserId().equals(userId)) {
            return ServiceResultEnum.NO_PERMISSION_ERROR.getResult();
        }
        //数值相同，则不执行数据操作
        if (updateCartItemParam.getGoodsCount().equals(mallShoppingCartItemUpdate.getGoodsCount())) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        mallShoppingCartItemUpdate.setGoodsCount(updateCartItemParam.getGoodsCount());
        mallShoppingCartItemUpdate.setUpdateTime(new Date());
        //修改记录
        if (mallShoppingCartItemMapper.updateByPrimaryKeySelective(mallShoppingCartItemUpdate) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public MallShoppingCartItem getNewBeeMallCartItemById(Long newBeeMallShoppingCartItemId) {
        MallShoppingCartItem mallShoppingCartItem = mallShoppingCartItemMapper.selectByPrimaryKey(newBeeMallShoppingCartItemId);
        if (mallShoppingCartItem == null) {
            MallException.fail(ServiceResultEnum.DATA_NOT_EXIST.getResult());
        }
        return mallShoppingCartItem;
    }

    @Override
    public Boolean deleteById(Long shoppingCartItemId, Long userId) {
        MallShoppingCartItem mallShoppingCartItem = mallShoppingCartItemMapper.selectByPrimaryKey(shoppingCartItemId);
        if (mallShoppingCartItem == null) {
            return false;
        }
        //userId不同不能删除
        if (!userId.equals(mallShoppingCartItem.getUserId())) {
            return false;
        }
        return mallShoppingCartItemMapper.deleteByPrimaryKey(shoppingCartItemId) > 0;
    }

    @Override
    public List<NewBeeMallShoppingCartItemVO> getMyShoppingCartItems(Long newBeeMallUserId) {
        List<NewBeeMallShoppingCartItemVO> newBeeMallShoppingCartItemVOS = new ArrayList<>();
        List<MallShoppingCartItem> mallShoppingCartItems = mallShoppingCartItemMapper.selectByUserId(newBeeMallUserId, Constants.SHOPPING_CART_ITEM_TOTAL_NUMBER);
        return getNewBeeMallShoppingCartItemVOS(newBeeMallShoppingCartItemVOS, mallShoppingCartItems);
    }

    @Override
    public List<NewBeeMallShoppingCartItemVO> getCartItemsForSettle(List<Long> cartItemIds, Long newBeeMallUserId) {
        List<NewBeeMallShoppingCartItemVO> newBeeMallShoppingCartItemVOS = new ArrayList<>();
        if (CollectionUtils.isEmpty(cartItemIds)) {
            MallException.fail("购物项不能为空");
        }
        List<MallShoppingCartItem> mallShoppingCartItems = mallShoppingCartItemMapper.selectByUserIdAndCartItemIds(newBeeMallUserId, cartItemIds);
        if (CollectionUtils.isEmpty(mallShoppingCartItems)) {
            MallException.fail("购物项不能为空");
        }
        if (mallShoppingCartItems.size() != cartItemIds.size()) {
            MallException.fail("参数异常");
        }
        return getNewBeeMallShoppingCartItemVOS(newBeeMallShoppingCartItemVOS, mallShoppingCartItems);
    }

    /**
     * 数据转换
     *
     * @param newBeeMallShoppingCartItemVOS
     * @param mallShoppingCartItems
     * @return
     */
    private List<NewBeeMallShoppingCartItemVO> getNewBeeMallShoppingCartItemVOS(List<NewBeeMallShoppingCartItemVO> newBeeMallShoppingCartItemVOS, List<MallShoppingCartItem> mallShoppingCartItems) {
        if (!CollectionUtils.isEmpty(mallShoppingCartItems)) {
            //查询商品信息并做数据转换
            List<Long> newBeeMallGoodsIds = mallShoppingCartItems.stream().map(MallShoppingCartItem::getGoodsId).collect(Collectors.toList());
            List<MallGoods> mallGoods = mallGoodsMapper.selectByPrimaryKeys(newBeeMallGoodsIds);
            Map<Long, MallGoods> newBeeMallGoodsMap = new HashMap<>();
            if (!CollectionUtils.isEmpty(mallGoods)) {
                newBeeMallGoodsMap = mallGoods.stream().collect(Collectors.toMap(MallGoods::getGoodsId, Function.identity(), (entity1, entity2) -> entity1));
            }
            for (MallShoppingCartItem mallShoppingCartItem : mallShoppingCartItems) {
                NewBeeMallShoppingCartItemVO newBeeMallShoppingCartItemVO = new NewBeeMallShoppingCartItemVO();
                BeanUtil.copyProperties(mallShoppingCartItem, newBeeMallShoppingCartItemVO);
                if (newBeeMallGoodsMap.containsKey(mallShoppingCartItem.getGoodsId())) {
                    MallGoods mallGoodsTemp = newBeeMallGoodsMap.get(mallShoppingCartItem.getGoodsId());
                    newBeeMallShoppingCartItemVO.setGoodsCoverImg(mallGoodsTemp.getGoodsCoverImg());
                    String goodsName = mallGoodsTemp.getGoodsName();
                    // 字符串过长导致文字超出的问题
                    if (goodsName.length() > 28) {
                        goodsName = goodsName.substring(0, 28) + "...";
                    }
                    newBeeMallShoppingCartItemVO.setGoodsName(goodsName);
                    newBeeMallShoppingCartItemVO.setSellingPrice(mallGoodsTemp.getSellingPrice());
                    newBeeMallShoppingCartItemVO.setOrginalPrice(mallGoodsTemp.getOriginalPrice());
                    newBeeMallShoppingCartItemVOS.add(newBeeMallShoppingCartItemVO);
                }
            }
        }
        return newBeeMallShoppingCartItemVOS;
    }

    @Override
    public PageResult getMyShoppingCartItems(PageQueryUtil pageUtil) {
        List<NewBeeMallShoppingCartItemVO> newBeeMallShoppingCartItemVOS = new ArrayList<>();
        List<MallShoppingCartItem> mallShoppingCartItems = mallShoppingCartItemMapper.findMyNewBeeMallCartItems(pageUtil);
        int total = mallShoppingCartItemMapper.getTotalMyNewBeeMallCartItems(pageUtil);
        PageResult pageResult = new PageResult(getNewBeeMallShoppingCartItemVOS(newBeeMallShoppingCartItemVOS, mallShoppingCartItems), total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }
}

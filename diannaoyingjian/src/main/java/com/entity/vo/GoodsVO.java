package com.entity.vo;

import com.entity.GoodsEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 硬件
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email
 * @date 2021-04-01
 */
@TableName("goods")
public class GoodsVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 硬件名称
     */

    @TableField(value = "goods_name")
    private String goodsName;


    /**
     * 硬件类型
     */

    @TableField(value = "goods_types")
    private Integer goodsTypes;


    /**
     * 硬件数量
     */

    @TableField(value = "goods_number")
    private Integer goodsNumber;


    /**
     * 硬件图片
     */

    @TableField(value = "goods_photo")
    private String goodsPhoto;


    /**
     * 单位
     */

    @TableField(value = "danwei")
    private String danwei;


    /**
     * 单价
     */

    @TableField(value = "danjia")
    private Double danjia;


    /**
     * 硬件详情
     */

    @TableField(value = "goods_content")
    private String goodsContent;


    /**
     * 是否删除
     */

    @TableField(value = "flag")
    private Integer flag;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "create_time")
    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：硬件名称
	 */
    public String getGoodsName() {
        return goodsName;
    }


    /**
	 * 获取：硬件名称
	 */

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }
    /**
	 * 设置：硬件类型
	 */
    public Integer getGoodsTypes() {
        return goodsTypes;
    }


    /**
	 * 获取：硬件类型
	 */

    public void setGoodsTypes(Integer goodsTypes) {
        this.goodsTypes = goodsTypes;
    }
    /**
	 * 设置：硬件数量
	 */
    public Integer getGoodsNumber() {
        return goodsNumber;
    }


    /**
	 * 获取：硬件数量
	 */

    public void setGoodsNumber(Integer goodsNumber) {
        this.goodsNumber = goodsNumber;
    }
    /**
	 * 设置：硬件图片
	 */
    public String getGoodsPhoto() {
        return goodsPhoto;
    }


    /**
	 * 获取：硬件图片
	 */

    public void setGoodsPhoto(String goodsPhoto) {
        this.goodsPhoto = goodsPhoto;
    }
    /**
	 * 设置：单位
	 */
    public String getDanwei() {
        return danwei;
    }


    /**
	 * 获取：单位
	 */

    public void setDanwei(String danwei) {
        this.danwei = danwei;
    }
    /**
	 * 设置：单价
	 */
    public Double getDanjia() {
        return danjia;
    }


    /**
	 * 获取：单价
	 */

    public void setDanjia(Double danjia) {
        this.danjia = danjia;
    }
    /**
	 * 设置：硬件详情
	 */
    public String getGoodsContent() {
        return goodsContent;
    }


    /**
	 * 获取：硬件详情
	 */

    public void setGoodsContent(String goodsContent) {
        this.goodsContent = goodsContent;
    }
    /**
	 * 设置：是否删除
	 */
    public Integer getFlag() {
        return flag;
    }


    /**
	 * 获取：是否删除
	 */

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
    /**
	 * 设置：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}

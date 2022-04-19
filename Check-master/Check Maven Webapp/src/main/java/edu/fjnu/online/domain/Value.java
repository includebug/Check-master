package edu.fjnu.online.domain;
/**
 * 变量类型
 * @author hspcadmin
 *
 */
public class Value {
    /**变量编号*/
    private int valueId;
    /**变量类型名称*/
    private int valueType;
    /**上限*/
    private int lowerLimit;
    /**下限*/
    private int upperLimit;
    public int getValueId() {
        return valueId;
    }
    public void setValueId(int valueId) {
        this.valueId = valueId;
    }
    public int getValueType() {
        return valueType;
    }
    public void setValueType(int valueType) {
        this.valueType = valueType;
    }
    public int getLowerLimit() {
        return lowerLimit;
    }
    public void setLowerLimit(int lowerLimit) {
        this.lowerLimit = lowerLimit;
    }
    public int getUpperLimit() {
        return upperLimit;
    }
    public void setUpperLimit(int upperLimit) {
        this.upperLimit = upperLimit;
    }

    public Value() {

    }
    public Value(int valueId, int valueType, int lowerLimit, int upperLimit) {
        super();
        this.valueId = valueId;
        this.valueType = valueType;
        this.lowerLimit = lowerLimit;
        this.upperLimit = upperLimit;
    }
    @Override
    public String toString() {
        return "Value [valueId=" + valueId + ", valueType=" + valueType + ", lowerLimit="
                + lowerLimit + ", upperLimit=" + upperLimit + "]";
    }
}

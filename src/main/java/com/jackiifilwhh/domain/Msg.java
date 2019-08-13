package com.jackiifilwhh.domain;

import java.util.HashMap;
import java.util.Map;

/**
 * @author:   Jackiifilwhh
 * @email:    jackiiliu@163.com
 * @date:     2019/8/5-15:57
 * @module:   domain
 * @describe: 通用信息的实体类，方便信息的传递
 * @version:  v1.0
 * @since:    1.0.0
 * @JIRA:     **
 */
public class Msg {
    //状态码,100表示成功，200表示失败
    private int code;
    //提示信息
    private String msg;
    //用户要返回给浏览器的数据
    private Map<String, Object> extend = new HashMap<>();

    /**
     * 处理成功的返回方法
     * @author : Jackiifilwhh
     * @date : 2019/8/5 16:02
     * @param null
     * @return : com.jackiifilwhh.domain.Msg
     */
    public static Msg succeed(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功！");
        return result;
    }

    /**
     * 处理失败的返回方法
     * @author : Jackiifilwhh
     * @date : 2019/8/5 16:02
     * @param null
     * @return : com.jackiifilwhh.domain.Msg
     */
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败！");
        return result;
    }

    /**
     * 链式方法，用来存入数据
     * @author : Jackiifilwhh
     * @date : 2019/8/5 16:04
     * @param key :
     * @param value :
     * @return : com.jackiifilwhh.domain.Msg
     */
    public Msg add(String key, Object value){
        this.getExtend().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}

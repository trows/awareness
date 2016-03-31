package com.awareness.trows.dao;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Throws_exception on 2015/5/29.
 */
public interface Idao<Entity,Key extends Serializable> {
    public void insert(Entity entity ,String operate);
    public void update(Entity entity ,String operate);
    public void updateByKey(Class<Entity> entityClass,Key key,String operate);
    public void deleteByValue(Entity entity,String operate);
    public void deleteByKey(Class<Entity> entityClass,Key key,String operate);

    /**
     * 获得一列实体
     * @param key
     * @param operate
     * @return
     */
    public List<Entity> getListByKey(Class<Entity> entityClass,Key key,String operate);
    public  List<Entity> getListByValue(Entity entity,String operate);
    public List<Entity> getListByStr(Class<Entity> entityClass,String str,String operate);
    /**
     *ͨ获得一个实体
     * @param key
     * @param operate
     * @return
     */
    public Entity getEntityByKey(Class<Entity> entityClass,Key key,String operate);
    public Entity getEntityByValue(Entity entity,String operate);
    public Entity getEntityByStr(Class<Entity> entityClass,String str,String operate);

    public Long getKeyByValue(Entity entity,String operate);

    /**
     * 万能方法不解释
     * @param entityClass
     * @param obj
     * @param operate
     * @return
     */
    public Object getOneObjectByObject (Class<Entity> entityClass,Object obj,String operate);

    public List<Object> getObjectListByObject(Object obj,String operate);



}

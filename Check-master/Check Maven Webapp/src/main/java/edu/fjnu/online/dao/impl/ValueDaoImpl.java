package edu.fjnu.online.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import edu.fjnu.online.dao.ValueDao;
import edu.fjnu.online.domain.Value;
@Repository
public class ValueDaoImpl extends BaseDaoImpl<Value> implements ValueDao {

    public ValueDaoImpl() {
        this.setNs("edu.fjnu.online.mapper.ValueMapper.");
    }
}

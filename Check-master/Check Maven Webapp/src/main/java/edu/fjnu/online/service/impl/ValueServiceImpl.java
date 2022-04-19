package edu.fjnu.online.service.impl;

import java.util.List;

import edu.fjnu.online.domain.Value;
import edu.fjnu.online.service.ValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.online.dao.ValueDao;

@Service
public class ValueServiceImpl implements ValueService {
    @Autowired
    ValueDao valueDao;

    public List<Value> find(Value value) {
        return valueDao.find(value);
    }

    public Value get(int id) {
        return valueDao.get(id);
    }

    public void insert(Value value) {
        valueDao.insert(value);
    }

    public void update(Value value) {
        valueDao.update(value);
    }

    public void delete(int id) {
        valueDao.delete(id);
    }

    public PageInfo<Value> findByPage(Value value, Integer pageNo, Integer pageSize) {
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        PageHelper.startPage(pageNo, pageSize);
        List<Value> list = valueDao.find(value);
        //用PageInfo对结果进行包装
        PageInfo<Value> page = new PageInfo<Value>(list);
        return page;
    }
}

package edu.fjnu.online.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import edu.fjnu.online.domain.Course;
import edu.fjnu.online.domain.Value;
public interface ValueService {
    public List<Value> find(Value value);
    public Value get(int id);
    public void insert(Value type);
    public void update(Value type);
    public void delete(int id);
    public PageInfo<Value> findByPage(Value type, Integer pageNo,Integer pageSize);
}

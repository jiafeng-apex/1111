package com.xinpengdu.service;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.Certigier;
import com.xinpengdu.persistence.CertigierMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;


/**
 * 授权人信息服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation= Propagation.REQUIRED)
public class CertigierService {

    @Autowired
    private CertigierMapper certigierMapper;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = certigierMapper.count(params);
        List<Map<String, Object>> list = certigierMapper.queryList(params);
        JSONObject resultObj = Tool.getJsonDataReturn(total, list);
        return resultObj.toString();
    }

    public String getInfoById(String id) throws Exception {
        Map<String, Object> map = Tool.transBean2Map(get(id));
        JSONObject jsonObject = Tool.getSuccessReturnJSONObject();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            jsonObject.put(entry.getKey(), entry.getValue());
        }
        return jsonObject.toString();
    }

    public List<Certigier> query(Object value) {
        return certigierMapper.query(value);
    }

    public void save(Certigier certigier) {
        certigier.setCertigierId(UUID.randomUUID().toString());
        String createDate = DateUtil.dateTime2String(new Date());
        certigier.setCreateDate(createDate);
        certigier.setLastUpdateDate(createDate);
        certigierMapper.save(certigier);
    }

    public Certigier get(String id) {
        return certigierMapper.get(id);
    }

    public Certigier getCertigierEditInfo(Map<String, Object> params) {
        return certigierMapper.getCertigierEditInfo(params);
    }

    public void update(Certigier certigier) {
        certigier.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        certigierMapper.update(certigier);
    }

    public void deleteById(String id) {
        certigierMapper.deleteById(id);
    }

}

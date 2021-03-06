package com.xinpengdu.web.op.project;

import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.entity.project.MaterialGeld;
import com.xinpengdu.service.MaterialGeldService;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


/**
 * 材料支付款信息
 */
@Controller
@RequestMapping(value = "/op/materialGeld")
public class MaterialGeldController {
    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private MaterialGeldService materialGeldService;

    /**
     * 获取材料支付款列表信息
     *
     * @param offset
     * @param limit
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String list(String materialContractId, @RequestParam int offset, @RequestParam int limit, HttpSession session) {
        try {
            if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_INFO, PERMISSION_ACTION.READ)) {
                AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
                Map<String, Object> params = new HashMap<>();
                params.put("offset", offset);
                params.put("limit", limit);
                params.put("materialContractId", materialContractId);
                String result = materialGeldService.queryList(params);
                return result;
            }
        } catch (Exception e) {
            logger.error("操作失败:" + e.getMessage(), e);
        }
        return Tool.getJsonNoDataGridDataReturn();
    }

    @ResponseBody
    @RequestMapping(value = "/getInfo", method = RequestMethod.POST)
    public String getInfo(@RequestParam String id) {
        try {
            return materialGeldService.getInfoById(id);
        } catch (Exception e) {
            logger.error("获取材料支付款信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
    public String saveInfo(@RequestParam String data) {
        try {
            System.out.println(data);
            MaterialGeld materialGeld = (MaterialGeld) JSONObject.toBean(JSONObject.fromObject(data), MaterialGeld.class);
            materialGeldService.save(materialGeld);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("保存材料支付款信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String updateInfo(@RequestParam String data) {
        try {
            MaterialGeld materialGeld = (MaterialGeld) JSONObject.toBean(JSONObject.fromObject(data), MaterialGeld.class);
            MaterialGeld oldMaterialGeld=materialGeldService.get(materialGeld.getMaterialGeldId());
            //修改本条记录
            materialGeldService.update(materialGeld);
            if(oldMaterialGeld!=null){
                float oldPayAmount= Float.parseFloat(oldMaterialGeld.getPayAmount().replace(",",""));
                float payAmount= Float.parseFloat(materialGeld.getPayAmount().replace(",",""));
                float differVal=payAmount-oldPayAmount;
                //修改其他记录
                materialGeldService.updates(differVal,materialGeld.getPayDate());
            }
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新材料支付款信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam String id) {
        try {
            MaterialGeld oldMaterialGeld=materialGeldService.get(id);
            materialGeldService.deleteById(id);
            if(oldMaterialGeld!=null){
                float oldPayAmount= Float.parseFloat(oldMaterialGeld.getPayAmount().replace(",",""));
                float differVal=0-oldPayAmount;
                //修改其他记录
                materialGeldService.updates(differVal,oldMaterialGeld.getPayDate());
            }
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新材料支付款信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

}

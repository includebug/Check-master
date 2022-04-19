package edu.fjnu.online.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import edu.fjnu.online.service.ValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import edu.fjnu.online.domain.Course;
import edu.fjnu.online.domain.Type;
import edu.fjnu.online.domain.Value;
import edu.fjnu.online.service.TypeService;

@Controller
public class ValueController {
    @Autowired
    ValueService valueService;

    @RequestMapping("/toValuePage.action")
    public String toTypePage(@RequestParam(value="page", defaultValue="1") int page,
                             Value value,Model model, HttpSession session){
//		List<Type> dataList = typeService.find(type);
        PageInfo<Value> pageInfo = valueService.findByPage(value, page, 5);
        List<Value> dataList = pageInfo.getList();
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo);
        return "/admin/value-mgt.jsp";
    }

    @RequestMapping("/qryValuePage.action")
    @ResponseBody
    public List<Value> qryTypePage(@RequestParam(value="page", defaultValue="1") int page,
                                  Value value,Model model, HttpSession session){
//		List<Type> dataList = typeService.find(type);
        PageInfo<Value> pageInfo = valueService.findByPage(value, page, 5);
        List<Value> dataList = pageInfo.getList();
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo);
        return dataList;
    }

    /**
     * 删除题型信息
     * @param typeId	题型编号，删除多个是，id用逗号分隔开
     * @param model
     * @return
     */
    @RequestMapping("/deleteValue.action")
    public String deleteUser(String typeId, Model model){
        if(typeId != null){
            String ids[] = typeId.split(",");
            for(int i=0;i<ids.length;i++){
                valueService.delete(Integer.parseInt(ids[i]));
            }
        }
        return "redirect:/toValuePage.action";
    }
    /**
     * 跳转到添加用户信息页面
     * @param user
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toAddValue.action")
    public String toAddType(Value value, Model model, HttpSession session){
        List<Value> dataList = valueService.find(value);
        model.addAttribute("dataList", dataList);
        return "/admin/value-reg.jsp";
    }

    /**
     * 添加题型信息
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/addValue.action")
    public String addType(Value value, Model model){
        valueService.insert(value);
        return "redirect:/toValuePage.action";
    }

    /**
     * 查看题型信息
     * @param type
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toQryValue.action")
    public String toQryType(int valueId, Model model, HttpSession session){
        Value typeInfo = valueService.get(valueId);
        model.addAttribute("type", typeInfo);
        return "/admin/value-qry.jsp";
    }

    /**
     * 跳转到更新题型信息页面
     * @param type
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toUpdValue.action")
    public String toUpdType(int valueId, Model model, HttpSession session){
        Value typeInfo = valueService.get(valueId);
        model.addAttribute("type", typeInfo);
        return "/admin/value-upd.jsp";
    }

    /**
     * 更新题型信息
     * @param type
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/updValue.action")
    public String updType(Value value, Model model, HttpSession session){
        valueService.update(value);
        return "redirect:/toValuePage.action";
    }

    /**
     * 删除题型信息
     * @param type
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/delValue.action")
    public String delType(int typeId, Model model, HttpSession session){
        valueService.delete(typeId);
        return "redirect:/toValuePage.action";
    }
}

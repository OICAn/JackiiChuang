package com.jackiifilwhh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jackiifilwhh.domain.Employee;
import com.jackiifilwhh.domain.Msg;
import com.jackiifilwhh.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "/employee")
public class EmployeeController {
    @Autowired
    private IEmployeeService employeeService;
    private final Integer pageNums = 5;
    /**
     * 返回所有员工信息
     * @author : Jackiifilwhh
     * @date : 2019/8/5 15:48
     * @param pn : 请求员工信息的页面数
     * @return : com.github.pagehelper.PageInfo
     */
    @RequestMapping(path = "/test")
    @ResponseBody
    public Msg getEmployeesWithJson(@RequestParam(value = "pn", defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,pageNums);
        List<Employee> list = employeeService.findAllEmployee();
        PageInfo pageInfo = new PageInfo(list, pageNums);
        return Msg.succeed().add("pageInfo", pageInfo);
    }
    @RequestMapping(path = "/main")
    public String success(){
        return "main";
    }

    /**
     * 员工新增的方法
     * @author : Jackiifilwhh
     * @date : 2019/8/6 14:59
     * @param employee : 需要新增的员工信息
     * @return : com.jackiifilwhh.domain.Msg
     */
    @RequestMapping(path = "saveEmployee", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmployee(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            Map<String, Object> map = new HashMap<>();
            //校验失败，在模态框中提示失败
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError:fieldErrors){
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            employeeService.addEmployee(employee);
            return Msg.succeed();
        }
    }
    
    /**
     * 检查是否存在该用户名
     * @author : Jackiifilwhh
     * @date : 2019/8/6 20:19 
     * @param EName : 被检查的用户名
     * @return : com.jackiifilwhh.domain.Msg
     */
    @ResponseBody
    @RequestMapping("/checkUser")
    public Msg checkUser(@RequestParam("EName") String EName){
        //如果存在，则提示不能使用该姓名
        if(employeeService.isNameExisted(EName)){
            return Msg.fail();
        }else {
            return Msg.succeed();
        }
    }

    /**
     * 根据员工id查询员工信息
     * @author : Jackiifilwhh
     * @date : 2019/8/7 21:33
     * @param id : 需要查询的员工的id
     * @return : com.jackiifilwhh.domain.Msg
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.findEmployeeById(id);
        return Msg.succeed().add("employee", employee);
    }

    /**
     * 修改员工信息
     * @author : Jackiifilwhh
     * @date : 2019/8/7 21:36
     * @param employee : 被修改的员工
     * @return : com.jackiifilwhh.domain.Msg
     */
    @RequestMapping(value = "/{EId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg modifyEmployee(Employee employee){
        System.out.println(employee);
        employeeService.modifyEmployee(employee);
        return Msg.succeed();
    }

    /**
     * 根据id串删除员工，如果有多个员工需要删除,ids中会包括"-"
     * @author : Jackiifilwhh
     * @date : 2019/8/8 16:01
     * @param ids : 被删除的员工的id串
     * @return : com.jackiifilwhh.domain.Msg
     */
    @RequestMapping(value = "/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmployee(@PathVariable("ids") String ids){
        if(ids.contains("-")){
            String []idArray = ids.split("-");
            for (String id:idArray){
                employeeService.deleteEmployee(Integer.parseInt(id));
            }
        }else{
            employeeService.deleteEmployee(Integer.parseInt(ids));
        }
        return Msg.succeed();
    }
}

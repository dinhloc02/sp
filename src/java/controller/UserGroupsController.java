/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserGroupsDAO;
import entity.UserGroups;
import entity.UserGroupsInsert;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Dell
 */
@Controller
public class UserGroupsController {

    private UserGroupsDAO userGroupsDAO;

    @Autowired
    public void setUserGroupsDAO(UserGroupsDAO userGroupsDAO) {
        this.userGroupsDAO = userGroupsDAO;
    }

    @RequestMapping(value = "/listUG")
    public String listUserGroups(Model model) {
        model.addAttribute("listUserGroup", userGroupsDAO.getAllUserGroups());
        return "listUserGroup";
    }

    @RequestMapping(value = "/detailUserGroup")
    public String detail(@RequestParam("userGroupID") Integer userGroupID, Model model) {
        model.addAttribute("e", userGroupsDAO.getUserGroupById(userGroupID));
        return "detailUserGroup";
    }

    @RequestMapping(value = "/initAddUserGroup")
    public String initAdd(Model model) {
        model.addAttribute("ug", new UserGroups());
        return "addUserGroup";
    }

    @RequestMapping(value = "/addUserGroup")
    public String insertUserGroup(@Valid @ModelAttribute("ug") UserGroupsInsert ug, BindingResult result, RedirectAttributes attributes, Model model) {
        if (result.hasErrors()) {
            return "addUserGroup";
        }
        UserGroups c = new UserGroups();
        c.setName(ug.getName());
        c.setDescription(ug.getDescription());
        Boolean blInsert = userGroupsDAO.insertUserGroup(c);
        if (blInsert) {
            attributes.addFlashAttribute("notificationsSuccessfully", "Th??m m???i d??? li???u th??nh c??ng!");
            return "redirect:/listUG.htm";
        } else {
            model.addAttribute("notificationsError", "???? c?? l???i khi th??m d??? li???u!");
            return "addUserGroup";
        }
    }

    @RequestMapping(value = "/initUpdateUserGroup")
    public String initUpdate(@RequestParam("userGroupID") Integer userGroupID, Model model) {
        UserGroups objA = userGroupsDAO.getUserGroupById(userGroupID);
        model.addAttribute("ug", objA);
        return "updateUserGroup";
    }

    @RequestMapping(value = "/updateUserGroup")
    public String updateUserGroup(@Valid @ModelAttribute("ug") UserGroupsInsert ug, BindingResult result, RedirectAttributes attributes, Model model) {
        if (result.hasErrors()) {
            return "updateUserGroup";
        }
        UserGroups c = new UserGroups();
        c.setUserGroupID(ug.getUserGroupID());
        c.setName(ug.getName());
        c.setDescription(ug.getDescription());
        Boolean blUpdate = userGroupsDAO.updateUserGroup(c);
        if (blUpdate) {
            attributes.addFlashAttribute("notificationsSuccessfully", "C???p nh???t d??? li???u th??nh c??ng!");
            return "redirect:/listUG.htm";
        } else {
            model.addAttribute("notificationsError", "???? c?? l???i khi c???p nh???t d??? li???u!");
            return "updateUserGroup";
        }
    }

    @RequestMapping(value = "/deleteUserGroup")
    public String deleteEmp(@RequestParam("userGroupID") Integer userGroupID, Model model) {
        Boolean blDelete = userGroupsDAO.deleteUserGroup(userGroupID);
        if (blDelete) {
            model.addAttribute("notificationsSuccessfully", "X??a d??? li???u th??nh c??ng!");
        } else {
            model.addAttribute("notificationsError", "???? c?? l???i khi x??a d??? li???u");
        }
        model.addAttribute("listUserGroup", userGroupsDAO.getAllUserGroups());
        return "listUserGroup";
    }
}

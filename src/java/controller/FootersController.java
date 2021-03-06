/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.FootersDAO;
import entity.Footers;
import entity.FootersInsert;
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
public class FootersController {

    private FootersDAO footersDAO;

    @Autowired
    public void setFootersDAO(FootersDAO footersDAO) {
        this.footersDAO = footersDAO;
    }

    @RequestMapping(value = "/listF")
    public String listFooters(Model model) {
        model.addAttribute("listFooter", footersDAO.getAllFooters());
        return "listFooter";
    }

    @RequestMapping(value = "/detailFooter")
    public String detail(@RequestParam("footerID") Integer footerID, Model model) {
        model.addAttribute("e", footersDAO.getFooterById(footerID));
        return "detailFooter";
    }

    @RequestMapping(value = "/initAddFooter")
    public String initAdd(Model model) {
        model.addAttribute("f", new Footers());
        return "addFooter";
    }

    @RequestMapping(value = "/addFooter")
    public String insertFooter(@Valid @ModelAttribute("f") FootersInsert f, BindingResult result, RedirectAttributes attributes, Model model) {
        if (result.hasErrors()) {
            return "addFooter";
        }
        Footers c = new Footers();
        c.setName(f.getName());
        c.setContent(f.getContent());
        c.setStatus(f.getStatus());
        Boolean blInsert = footersDAO.insertFooter(c);
        if (blInsert) {
            attributes.addFlashAttribute("notificationsSuccessfully", "Th??m m???i d??? li???u th??nh c??ng!");
            return "redirect:/listF.htm";
        } else {
            model.addAttribute("notificationsError", "???? c?? l???i khi th??m d??? li???u!");
            return "addFooter";
        }
    }

    @RequestMapping(value = "/initUpdateFooter")
    public String initUpdate(@RequestParam("footerID") Integer footerID, Model model) {
        Footers objA = footersDAO.getFooterById(footerID);
        model.addAttribute("f", objA);
        return "updateFooter";
    }

    @RequestMapping(value = "/updateFooter")
    public String updateFooter(@Valid @ModelAttribute("f") FootersInsert f, BindingResult result, RedirectAttributes attributes, Model model) {
        if (result.hasErrors()) {
            return "updateFooter";
        }
        Footers c = new Footers();
        c.setFooterID(f.getFooterID());
        c.setName(f.getName());
        c.setContent(f.getContent());
        c.setStatus(f.getStatus());
        Boolean blUpdate = footersDAO.updateFooter(c);
        if (blUpdate) {
            attributes.addFlashAttribute("notificationsSuccessfully", "C???p nh???t d??? li???u th??nh c??ng!");
            return "redirect:/listF.htm";
        } else {
            model.addAttribute("notificationsError", "???? c?? l???i khi c???p nh???t d??? li???u!");
            return "updateFooter";
        }
    }

    @RequestMapping(value = "/deleteFooter")
    public String deleteEmp(@RequestParam("footerID") Integer footerID, Model model) {
        Boolean blDelete = footersDAO.deleteFooter(footerID);
        if (blDelete) {
            model.addAttribute("notificationsSuccessfully", "X??a d??? li???u th??nh c??ng!");
        } else {
            model.addAttribute("notificationsError", "???? c?? l???i khi x??a d??? li???u");
        }
        model.addAttribute("listFooter", footersDAO.getAllFooters());
        return "listFooter";
    }
}

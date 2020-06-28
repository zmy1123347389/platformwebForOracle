package com.behere.platform.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.behere.common.controller.BaseController;
import com.behere.common.utils.PageBean;
import com.behere.common.utils.PageUtils;
import com.behere.common.utils.Query;
import com.behere.platform.domain.AuthAccount;
import com.behere.platform.domain.RechargeDO;
import com.behere.platform.service.AccountService;
import com.github.pagehelper.PageHelper;

/**
 * @author: Behere
 */
@Controller
@RequestMapping(value = "/platform/account")
public class AccountController extends BaseController {

    private String prefix = "platform/account";

    @Autowired
    private AccountService accountService;


    @GetMapping("/authAccount")
    String authAccount(Model model) {
        return prefix + "/auth/auth_account";
    }


    @GetMapping("/recharge")
    String recharge(Model model) {
        return prefix + "/recharge/recharge";
    }

    @GetMapping("/rechargeList")
    @ResponseBody
    PageUtils rechargeList(@RequestParam Map<String, Object> params,PageBean pageBean) {
        // 查询列表数据
        Query query = new Query(params);
        PageHelper.startPage(pageBean.getPageNumber(), pageBean.getPageSize(),true);
        List<RechargeDO> rechargeList = accountService.queryRechargeList(query);
        int total = accountService.countRecharges(query);
        PageUtils pageUtil = new PageUtils(rechargeList, total);
        return pageUtil;
    }

    @RequestMapping("/listAuthAccount")
    @ResponseBody
    public PageUtils listAuthAccount(@RequestParam Map<String, Object> params,PageBean pageBean) {
        Query query = new Query(params);
        PageHelper.startPage(pageBean.getPageNumber(), pageBean.getPageSize(),true);
        List<AuthAccount> authAccounts = accountService.queryAuthAccount(query);
        int total = accountService.countAuthAccount(query);
        PageUtils pageUtil = new PageUtils(authAccounts, total);
        return pageUtil;
    }
}
package com.awareness.trows.serviceImpl;

import com.awareness.trows.base.AbstractBaseDao;
import com.awareness.trows.entity.Account;
import com.awareness.trows.service.AccountService;
import org.springframework.stereotype.Service;

/**
 * Created by Throws_exception on 2015/5/30.
 */
@Service("AccountService")
public class AccountSerImpl extends AbstractBaseDao<Account, Long> implements AccountService {
}

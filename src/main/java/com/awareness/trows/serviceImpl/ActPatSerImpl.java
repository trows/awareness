package com.awareness.trows.serviceImpl;

import com.awareness.trows.base.AbstractBaseDao;
import com.awareness.trows.entity.ActPat;
import com.awareness.trows.service.ActPatService;
import org.springframework.stereotype.Service;

/**
 * Created by Throws_exception on 2015/6/15.
 */
@Service("ActPatService")
public class ActPatSerImpl extends AbstractBaseDao<ActPat,Long> implements ActPatService {

}

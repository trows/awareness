package com.awareness.trows.serviceImpl;

import com.awareness.trows.base.AbstractBaseDao;
import com.awareness.trows.entity.Activity;
import com.awareness.trows.service.ActivityService;
import org.springframework.stereotype.Service;

/**
 * Created by Throws_exception on 2015/6/15.
 */
@Service("ActivityService")
public class ActivitySerImpl extends AbstractBaseDao<Activity,Long> implements ActivityService {
}

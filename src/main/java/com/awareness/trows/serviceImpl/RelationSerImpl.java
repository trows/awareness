package com.awareness.trows.serviceImpl;

import com.awareness.trows.base.AbstractBaseDao;
import com.awareness.trows.entity.Relation;
import com.awareness.trows.service.RelationService;
import org.springframework.stereotype.Service;

/**
 * Created by Throws_exception on 2015/8/25.
 */
@Service("RelationService")
public class RelationSerImpl extends AbstractBaseDao<Relation,Long> implements RelationService{
}

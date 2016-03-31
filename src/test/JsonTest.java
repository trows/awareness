import com.alibaba.fastjson.JSON;
import com.awareness.trows.util.wechatSDK.entity.WxConfig;
import com.awareness.trows.util.youbandUtil.CreatID;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by Throws_exception on 2015/7/28.
 */
public class JsonTest {

    @Test
    public void ListToJson(){
        Entity e1 = new Entity(1,"trows","man");
        Entity e2 = new Entity(2,"top","man");
        Entity e3 = new Entity(3,"lily","female");
        List<Entity> list = new ArrayList<Entity>();
        list.add(e1);
        list.add(e2);
        list.add(e3);
        String jsonStr = JSON.toJSONString(list);
        //[{"id":1,"name":"trows","sex":"man"},{"id":2,"name":"top","sex":"man"},{"id":3,"name":"lily","sex":"female"}]
        System.out.println(jsonStr);
    }

    @Test
    public void idTest(){
        long id = CreatID.getUserID();
        System.out.println(id);
        System.out.println((id+"").length());
    }

    @Test
    public void uuidLength(){
        System.out.println(UUID.randomUUID().toString().length());
        System.out.println(UUID.randomUUID());
    }

    @Test
    public void sha1Test(){
        String url = "http://180.76.143.33/addActivity.do";
        String timestamp =  "1440042522";
        String nonceStr =   "facc5745-b465-4201-9242-a1faf2";
        String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VJMgI4hMvPa-zPOmS1PJIHitmlFuK-eFxhwgt7H09Ln1T46y9gxHO3CjzVCCeRsaug";

        String string1 = "jsapi_ticket=" + jsapi_ticket +
                "&noncestr=" + nonceStr +
                "&timestamp=" + timestamp +
                "&url=" + url;

        String signature = DigestUtils.sha1Hex(string1);
        System.out.println(signature);
    }
}

package com.mossle.b2b.support;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class SupervisionProjectService {

    public List<SupervisionProjectDTO> getMockProjects() {
        List<SupervisionProjectDTO> list = new ArrayList<SupervisionProjectDTO>();
        list.add(new SupervisionProjectDTO("JL-24-001", "连云港港口码头扩建工程监理", "进行中", "success", "连云港市", "张伟", 98, "success"));
        list.add(new SupervisionProjectDTO("JL-24-002", "南京某高层住宅楼基坑支护工程", "整改中", "warning", "南京市鼓楼区", "刘强", 85, "warning"));
        list.add(new SupervisionProjectDTO("JL-24-003", "苏州工业园区科技大厦主体结构监理", "进行中", "success", "苏州市工业园区", "赵敏", 92, "success"));
        list.add(new SupervisionProjectDTO("JL-24-004", "无锡地铁3号线站点装修监理", "收尾中", "primary", "无锡市", "孙涛", 95, "success"));
        return list;
    }
}

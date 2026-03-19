package com.mossle.b2b.support;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class CostProjectService {

    public List<CostProjectDTO> getMockProjects() {
        List<CostProjectDTO> list = new ArrayList<CostProjectDTO>();
        list.add(new CostProjectDTO("ZJ-24-001", "徐州变电站二期扩建工程造价审核", "预结算审核", "王建国", "二审核定", 75, "450,000"));
        list.add(new CostProjectDTO("ZJ-24-002", "盐城海上风电场全过程造价跟踪咨询", "全过程跟踪", "李晓明", "实施中", 40, "1,200,000"));
        list.add(new CostProjectDTO("ZJ-24-003", "市政道路照明改造清单编制", "清单编制", "张伟", "立项草稿", 10, "85,000"));
        // Add more mock data to test pagination if needed
        list.add(new CostProjectDTO("ZJ-24-004", "南京地铁4号线三期工程概算", "概算编制", "赵丽", "待审核", 20, "320,000"));
        list.add(new CostProjectDTO("ZJ-24-005", "苏州工业园区厂房扩建结算审计", "结算审计", "陈刚", "已归档", 100, "150,000"));
        return list;
    }
}

package com.mossle.b2b.support;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class AgencyProjectService {

    public List<AgencyProjectDTO> getMockProjects() {
        List<AgencyProjectDTO> list = new ArrayList<AgencyProjectDTO>();
        list.add(new AgencyProjectDTO("DL-24-001", "南京市教育局2024年度信息化设备采购代理", "南京市教育局", "王建国", "进行中", "success", "85,000"));
        list.add(new AgencyProjectDTO("DL-24-002", "苏州市第一人民医院医疗器械招标代理", "苏州市第一人民医院", "李红", "审核中", "warning", "120,000"));
        list.add(new AgencyProjectDTO("DL-24-003", "扬州市市政道路绿化养护项目招标", "扬州市市政园林局", "张强", "已完结", "default", "45,000"));
        list.add(new AgencyProjectDTO("DL-24-004", "江苏省电力公司变压器采购专项代理", "江苏省电力公司", "刘洋", "进行中", "success", "210,000"));
        return list;
    }
}

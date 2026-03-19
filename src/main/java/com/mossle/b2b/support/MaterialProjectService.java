package com.mossle.b2b.support;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class MaterialProjectService {

    public List<MaterialProjectDTO> getMockProjects() {
        List<MaterialProjectDTO> list = new ArrayList<MaterialProjectDTO>();
        list.add(new MaterialProjectDTO("WZ-24-001", "徐州变电站二期扩建工程-电缆采购", "远东电缆有限公司", "2,450,000", "配送中", "success", 80));
        list.add(new MaterialProjectDTO("WZ-24-002", "南京地铁4号线-安防设备采购", "海康威视", "850,000", "采购中", "warning", 20));
        list.add(new MaterialProjectDTO("WZ-24-003", "盐城风电场-塔筒防腐涂料采购", "佐敦涂料", "560,000", "已入库", "default", 100));
        list.add(new MaterialProjectDTO("WZ-24-004", "苏州数据中心-服务器机柜采购", "华为技术有限公司", "3,200,000", "生产中", "primary", 45));
        return list;
    }
}

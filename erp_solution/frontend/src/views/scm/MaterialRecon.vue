<template>
  <div class="material-recon">
    <t-card title="物资采购与入库对账工作台" :bordered="false">
      <div class="toolbar" style="margin-bottom: 16px; display: flex; justify-content: space-between;">
        <t-space>
          <t-select placeholder="选择供应商" style="width: 200px" />
          <t-date-range-picker placeholder="对账周期" />
        </t-space>
        <t-button theme="primary" @click="handleAutoRecon">一键自动对账</t-button>
      </div>

      <t-row :gutter="16">
        <!-- Left: Purchase Orders -->
        <t-col :span="6">
          <h4 style="margin-bottom: 12px;">采购订单 (PO)</h4>
          <t-table
            row-key="id"
            :data="poData"
            :columns="poColumns"
            :selected-row-keys="selectedPOs"
            @select-change="(val) => selectedPOs = val"
          />
        </t-col>
        
        <!-- Right: Goods Receipt Notes -->
        <t-col :span="6">
          <h4 style="margin-bottom: 12px;">实际入库单 (GRN)</h4>
          <t-table
            row-key="id"
            :data="grnData"
            :columns="grnColumns"
            :selected-row-keys="selectedGRNs"
            @select-change="(val) => selectedGRNs = val"
          />
        </t-col>
      </t-row>
    </t-card>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';

const selectedPOs = ref([]);
const selectedGRNs = ref([]);

const poColumns = [
  { colKey: 'row-select', type: 'multiple' },
  { colKey: 'poCode', title: '采购单号' },
  { colKey: 'material', title: '物料' },
  { colKey: 'qty', title: '采购量' },
  { colKey: 'amount', title: '金额' }
];

const grnColumns = [
  { colKey: 'row-select', type: 'multiple' },
  { colKey: 'grnCode', title: '入库单号' },
  { colKey: 'material', title: '物料' },
  { colKey: 'actualQty', title: '实收量' },
  { colKey: 'status', title: '状态' }
];

const poData = ref([
  { id: 1, poCode: 'PO-2024-001', material: '高强钢筋', qty: '100吨', amount: '¥450,000' }
]);

const grnData = ref([
  { id: 1, grnCode: 'IN-2024-089', material: '高强钢筋', actualQty: '98吨', status: '差异待核' }
]);

const handleAutoRecon = () => {
  console.log('Executing intelligent matching algorithm...');
};
</script>

<template>
  <div class="project-360-view">
    <t-row :gutter="16">
      <!-- Left: WBS Tree -->
      <t-col :span="4">
        <t-card title="项目结构 (WBS)" :bordered="false" class="wbs-card">
          <t-tree :data="wbsData" hover expand-all />
        </t-card>
      </t-col>
      
      <!-- Right: Dashboard & Gantt -->
      <t-col :span="8">
        <t-row :gutter="16" class="kpi-cards">
          <t-col :span="6">
            <t-card title="合同总额" :bordered="false">
              <h2 class="metric-value text-brand">¥ 12,500,000.00</h2>
            </t-card>
          </t-col>
          <t-col :span="6">
            <t-card title="当前利润率预警" :bordered="false">
              <h2 class="metric-value text-warning">11.5% (预警线: 15%)</h2>
            </t-card>
          </t-col>
        </t-row>
        
        <t-card title="项目进度排程" :bordered="false" class="gantt-card" style="margin-top: 16px;">
          <div id="gantt_here" style="width:100%; height:400px;"></div>
        </t-card>
      </t-col>
    </t-row>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';

// Mock WBS Data
const wbsData = ref([
  {
    label: '徐州变电站扩建工程',
    value: '1',
    children: [
      { label: '土建工程', value: '1-1' },
      { label: '电气安装工程', value: '1-2', children: [
        { label: '高压柜安装', value: '1-2-1' },
        { label: '变压器就位', value: '1-2-2' }
      ]}
    ],
  },
]);

onMounted(() => {
  // Initialize dhtmlxGantt here in real implementation
  console.log('Gantt chart placeholder initialized');
});
</script>

<style scoped>
.metric-value { margin: 0; font-size: 24px; font-weight: 600; }
.text-brand { color: var(--td-brand-color); }
.text-warning { color: var(--td-warning-color); }
</style>

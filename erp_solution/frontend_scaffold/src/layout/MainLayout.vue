<template>
  <t-layout class="main-layout">
    <t-header>
      <t-head-menu theme="dark" value="dashboard">
        <template #logo>
          <h2 style="color: white; margin-left: 20px;">企业级工程 ERP</h2>
        </template>
        <t-menu-item value="dashboard"> 工作台 </t-menu-item>
        <t-menu-item value="projects"> 项目管理 </t-menu-item>
        <t-menu-item value="cost"> 成本管控 </t-menu-item>
        <t-menu-item value="scm"> 物资设备 </t-menu-item>
        
        <template #operations>
          <t-button variant="text" shape="square" style="color: white;">
            <template #icon><t-icon name="user" /></template>
          </t-button>
        </template>
      </t-head-menu>
    </t-header>
    
    <t-layout>
      <t-aside>
        <t-menu theme="light" value="pm-360">
          <t-menu-group title="核心业务">
            <t-menu-item value="pm-360" @click="$router.push('/pm/project-360')">
              <template #icon><t-icon name="dashboard" /></template>
              项目全景看板
            </t-menu-item>
            <t-menu-item value="scm-recon" @click="$router.push('/scm/material-recon')">
              <template #icon><t-icon name="cart" /></template>
              物资对账台
            </t-menu-item>
          </t-menu-group>
        </t-menu>
      </t-aside>
      
      <t-content style="padding: 24px; background: #f3f4f6; min-height: calc(100vh - 64px);">
        <router-view />
      </t-content>
    </t-layout>
  </t-layout>
</template>

<script setup lang="ts">
// Main Layout using TDesign components
</script>

<style scoped>
.main-layout {
  height: 100vh;
}
</style>

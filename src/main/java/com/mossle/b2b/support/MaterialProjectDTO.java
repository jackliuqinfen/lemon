package com.mossle.b2b.support;

public class MaterialProjectDTO {
    private String id;
    private String name;
    private String supplier;
    private String amount;
    private String status; // 配送中, 采购中
    private String statusType; // success, warning
    private int progress;

    public MaterialProjectDTO() {}

    public MaterialProjectDTO(String id, String name, String supplier, String amount, String status, String statusType, int progress) {
        this.id = id;
        this.name = name;
        this.supplier = supplier;
        this.amount = amount;
        this.status = status;
        this.statusType = statusType;
        this.progress = progress;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getSupplier() { return supplier; }
    public void setSupplier(String supplier) { this.supplier = supplier; }
    public String getAmount() { return amount; }
    public void setAmount(String amount) { this.amount = amount; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getStatusType() { return statusType; }
    public void setStatusType(String statusType) { this.statusType = statusType; }
    public int getProgress() { return progress; }
    public void setProgress(int progress) { this.progress = progress; }
}

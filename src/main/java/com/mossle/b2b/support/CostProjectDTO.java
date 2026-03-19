package com.mossle.b2b.support;

public class CostProjectDTO {
    private String id;
    private String name;
    private String type;
    private String manager;
    private String status;
    private int progress;
    private String amount;

    public CostProjectDTO() {}

    public CostProjectDTO(String id, String name, String type, String manager, String status, int progress, String amount) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.manager = manager;
        this.status = status;
        this.progress = progress;
        this.amount = amount;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getManager() { return manager; }
    public void setManager(String manager) { this.manager = manager; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public int getProgress() { return progress; }
    public void setProgress(int progress) { this.progress = progress; }
    public String getAmount() { return amount; }
    public void setAmount(String amount) { this.amount = amount; }
}

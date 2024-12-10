class Badge {
    public String print(Integer id, String name, String department) {
        StringBuilder builder = new StringBuilder();

        if (id != null)
            builder.append("[" + id.toString() + "] - ");
        
        builder.append(name + " - ");
        
        if (department != null) {
            builder.append(department.toUpperCase());
        } else {
            builder.append("OWNER");
        }
        
        return builder.toString();
    }
}

public class LogLine {
    private String logLevel;
    private String message;

    public LogLine(String logLine) {
        String[] parts = logLine.split("]: ");
        this.message = parts[1].trim();
        this.logLevel = parts[0].substring(1);
    }

    public LogLevel getLogLevel() {
        switch (this.logLevel) {
            case "TRC":
                return LogLevel.TRACE;
            case "DBG":
                return LogLevel.DEBUG;
            case "INF":
                return LogLevel.INFO;
            case "WRN":
                return LogLevel.WARNING;
            case "ERR":
                return LogLevel.ERROR;
            case "FTL":
                return LogLevel.FATAL;
            default:
                return LogLevel.UNKNOWN;
        }
    }

    public String getOutputForShortLog() {
        return this.getLogLevel().getValue() + ":" + this.message;
    }
}

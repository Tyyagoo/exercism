import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

class AppointmentScheduler {
  public LocalDateTime schedule(String appointmentDateDescription) {
    DateTimeFormatter parser = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
    return LocalDateTime.parse(appointmentDateDescription, parser);
  }

  public boolean hasPassed(LocalDateTime appointmentDate) {
    return appointmentDate.isBefore(LocalDateTime.now());
  }

  public boolean isAfternoonAppointment(LocalDateTime appointmentDate) {
    int h = appointmentDate.getHour();
    return h >= 12 && h < 18;
  }

  public String getDescription(LocalDateTime appointmentDate) {
    DateTimeFormatter printer = DateTimeFormatter.ofPattern("'You have an appointment on' EEEE, MMMM d, yyyy, 'at' K:mm a.");
    return appointmentDate.format(printer);
  }

  public LocalDate getAnniversaryDate() {
    return LocalDate.of(LocalDateTime.now().getYear(), 9, 15);
  }
}
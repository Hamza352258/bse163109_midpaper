package extra;

public class jobdata {
    private String title;
    private String description;
    private String jobtype;
    private String jobcity;
    private String date;
    private String time;


    // Parameterized Constructor to set Student
    // name, age, course enrolled in.
    public jobdata(String title, String description,String jobtype,String jobcity,String date,String time)
    {
        this.title = title;
        this.description = description;
        this.jobtype = jobtype;
        this.jobcity = jobcity;
        this.date=date;
        this.time=time;
    }
    // Setter Methods to set table data to be
    // displayed
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public String getJobtype() { return jobtype; }
    public String getJobcity() { return jobcity; }
    public String getTime() { return time; }
    public String getDate() { return date; }

}


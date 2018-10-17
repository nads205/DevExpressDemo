namespace DevExpress.Data.Data
{
    public class Errors
    {
        public int Id { get; set; }

        public int LoggingId { get; set; }

        public int ErrorCode { get; set; }

        public virtual Logging1 Logging1 { get; set; }
    }
}

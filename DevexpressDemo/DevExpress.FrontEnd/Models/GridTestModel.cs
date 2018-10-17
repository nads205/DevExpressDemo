using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DevExpress.Data.Data;
using DevExpress.Web;

namespace DevExpress.FrontEnd.Models
{
    public static class LargeDatabaseDataProvider
    {
        const string LargeDatabaseDataContextKey = "DXLargeDatabaseDataContext";
        public static QatarUat DB
        {
            get
            {
                if (HttpContext.Current.Items[LargeDatabaseDataContextKey] == null) 
                    HttpContext.Current.Items[LargeDatabaseDataContextKey] = new QatarUat();
                return (QatarUat)HttpContext.Current.Items[LargeDatabaseDataContextKey];
            }
        }

        public static IQueryable<CopyrightZones> CopyrightZones { get { return DB.CopyrightZones; } }
        public static IQueryable<CopyrightZonesView> CopyrightZonesView { get { return DB.CopyrightZonesView; } }
        public static IQueryable<Shelfmarks> Shelfmarks { get { return DB.Shelfmarks; } }

        public static IEnumerable<Shelfmarks> GetShelfmarkRange(ListEditItemsRequestedByFilterConditionEventArgs args)
        {
            var skip = args.BeginIndex;
            var take = args.EndIndex - args.BeginIndex + 1;
            var query = (from shelfmark in DB.Shelfmarks
                    where shelfmark.Shelfmark.StartsWith(args.Filter)
                    orderby shelfmark.Shelfmark
                    select shelfmark
                ).Skip(skip).Take(take);
            return query.ToList();
        }

        public static Shelfmarks GetShelfmarkByID(ListEditItemRequestedByValueEventArgs args)
        {
            int id;
            if (args.Value == null || !int.TryParse(args.Value.ToString(), out id))
                return null;
            return DB.Shelfmarks.Where(p => p.ShelfmarkId == id).Take(1).SingleOrDefault();
        }

        public static string GetShelfmarkByID(int shelfmarkId)
        {
            return DB.Shelfmarks.Find(shelfmarkId).Shelfmark;
        }

        public static string GetRightsExpressionById(int rightsExpressionId)
        {
            return DB.RightsExpressions.Find(rightsExpressionId).RightsExpression;
        }

        public static string GetCrzById(int crzId)
        {
            return DB.CopyrightZoneStatus.Find(crzId).CopyrightZoneStatus1;
        }


        public static IEnumerable GetShelfmarks()
        {
            var query = from shelfmark in DB.Shelfmarks
                select new
                {
                    ShelfmarkId = shelfmark.ShelfmarkId,
                    Shelfmark = shelfmark.Shelfmark,
                    GeneralNotes = shelfmark.GeneralNotes
                };
            return query.ToList();
        }

    }
}
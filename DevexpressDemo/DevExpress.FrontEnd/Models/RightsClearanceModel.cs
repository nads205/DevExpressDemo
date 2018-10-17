using System.Linq;
using DevExpress.Data.Data;
using DevExpress.Web;

namespace DevExpress.FrontEnd.Models
{  
  

    public static class RightsClearanceModelHelper
    {        

        public static object GetShelfmarkRange(ListEditItemsRequestedByFilterConditionEventArgs args)
        {
            var skip = args.BeginIndex;
            var take = args.EndIndex - args.BeginIndex + 1;

            var shelfmarks = new QatarUat(MvcApplication.DbName).Shelfmarks.Where(c => c.Shelfmark.StartsWith(args.Filter)).OrderBy(c => c.Shelfmark).Skip(skip).Take(take);
            return shelfmarks.Select(c=> new {c.Shelfmark, c.ShelfmarkId}).ToList();
        }

        public static object GetShelfmarkById(ListEditItemRequestedByValueEventArgs args)
        {
            int id;
            if (args.Value == null || !int.TryParse(args.Value.ToString(), out id))
                return null;
            return new QatarUat(MvcApplication.DbName).Shelfmarks.Where(p => p.ShelfmarkId == id).Select(c => new { c.Shelfmark, c.ShelfmarkId }).Take(1).ToList();
        }

        public static object GetAuthorityRange(ListEditItemsRequestedByFilterConditionEventArgs args)
        {
            var skip = args.BeginIndex;
            var take = args.EndIndex - args.BeginIndex + 1;

            var authorities = new QatarUat(MvcApplication.DbName).Authorities.Where(c => c.Name.StartsWith(args.Filter)).OrderBy(c => c.Name).Skip(skip).Take(take);
            return authorities.ToList();
        }

        public static object GetAuthorityById(ListEditItemRequestedByValueEventArgs args)
        {
            int id;
            if (args.Value == null || !int.TryParse(args.Value.ToString(), out id))
                return null;
            return new QatarUat(MvcApplication.DbName).Authorities.Where(p => p.AuthorityId == id).Take(1).ToList();
        }
    }
}
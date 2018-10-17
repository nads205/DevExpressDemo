using System.Web.UI.WebControls;
using DevExpress.Web;

namespace DevExpress.FrontEnd.Controllers
{
    public static class GridSettingsCommon
    {
        static GridSettingsCommon()
        {
            CommandColumnVisible = true;
            SettingsPagerPosition = PagerPosition.TopAndBottom;
            SettingsPagerVisible = true;
            ShowDetailRow = true;
            ConfirmDelete = true;
            GridViewEditingMode = GridViewEditingMode.Batch;
            FontName = "Segoe UI";
            FontBold = true;
            FontBoldHeader = true;
            PageSizeItems = new[] { "10", "20", "50", "100", "250" };
            PageSizeItemsVisible = true;
            PageFirstPageVisible = true;
            PageLastPageVisible = true;
            Width = Unit.Percentage(100);
            WidthCommandColumn = 75;
            HorizontalScrollBarMode = ScrollBarMode.Visible;
            GridViewBatchEditMode = GridViewBatchEditMode.Row;
            ShowFilterRow = true;
            ShowGroupPanel = true;
            BatchEditModifiedCell = System.Drawing.Color.LightSalmon;
            AccessKey = "G";
            ShowModelErrorsForEditors = true;
            KeyboardSupport = false;
            ShowNewButtonInHeader = true;
            ShowFilterBar = GridViewStatusBarMode.Visible;
            AllowHierarchicalColumns = true;
            ShowAllDataSourceColumns = true;
            AllowSelectByRowClick = true;
            SettingsSearchPanel = true;
            ShowHeaderFilterButton = true;
            StartEditAction = GridViewBatchStartEditAction.Click;
            ShowClearFilterButton = true;
            ShowFilterRowMenu = true;
        }

        public static bool CommandColumnVisible { get; private set; }
        public static bool ShowDeleteButton { get; private set; }
        public static PagerPosition SettingsPagerPosition { get; private set; }
        public static bool SettingsPagerVisible { get; private set; }
        public static bool ShowDetailRow { get; private set; }
        public static bool ConfirmDelete { get; private set; }
        public static GridViewEditingMode GridViewEditingMode { get; private set; }
        public static string FontName { get; private set; }
        public static bool FontBold { get; private set; }
        public static bool FontBoldHeader { get; private set; }
        public static string[] PageSizeItems { get; private set; }
        public static bool PageSizeItemsVisible { get; private set; }
        public static bool PageFirstPageVisible { get; private set; }
        public static bool PageLastPageVisible { get; private set; }
        public static Unit Width { get; private set; }
        public static Unit WidthCommandColumn { get; private set; }
        public static bool ShowFilterRow { get; private set; }
        public static bool ShowGroupPanel { get; private set; }
        public static ScrollBarMode HorizontalScrollBarMode { get; private set; }
        public static GridViewBatchEditMode GridViewBatchEditMode { get; private set; }
        public static System.Drawing.Color BatchEditModifiedCell { get; private set; }
        public static string AccessKey { get; private set; }
        public static bool KeyboardSupport { get; private set; }
        public static bool ShowNewButtonInHeader { get; private set; }
        public static bool ShowModelErrorsForEditors { get; private set; }
        public static GridViewStatusBarMode ShowFilterBar { get; private set; }
        public static bool AllowHierarchicalColumns { get; private set; }
        public static bool ShowAllDataSourceColumns { get; private set; }
        public static bool AllowSelectByRowClick { get; private set; }
        public static bool SettingsSearchPanel { get; private set; }
        public static bool ShowHeaderFilterButton { get; private set; }
        public static GridViewBatchStartEditAction StartEditAction { get; private set; }
        public static bool ShowClearFilterButton { get; private set; }
        public static bool ShowFilterRowMenu { get; private set; }
        
    }
}
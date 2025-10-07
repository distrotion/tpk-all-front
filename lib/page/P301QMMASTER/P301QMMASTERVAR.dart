import '../../bloc/BlocEvent/P301-02-P301QMMASTERgetINSP_SPEC.dart';

class P301QMMASTERVAR {
  static bool iscontrol = false;
  static String SEARCH = '';
  static String FILTER = '';
  static bool isHoveredClear = false;
  // static String formattedDate = '';

  static String day = '';
  static String month = '';
  static String year = '';

  static String day_next = '';
  static String month_next = '';
  static String year_next = '';

  static int pagepop = 0;
  static int pagepopapp = 0;
  static String INSP_LOTset = '';
  static String SELECTEDSETset = '';

  static List<PINSP_SPECclass> INSP_SPECdata = [];
  static PINSP_SPECclass iINSP_SPECdata = PINSP_SPECclass();
  static List<SELECTED_SETclass> SELECTED_SETdata = [];
  static SELECTED_SETclass iSELECTEDSETset = SELECTED_SETclass();
  static List<UDCODEclass> UDCODEdata = [];

  static String DATASUM = '';

  static String TO_ALL = '';
  static String TO_UR = '';

  static String TO_BL = '';

  static int iDATA = 0;

  static int holding = 999;

  static String PLANT = "2100";
  static String LOT_ORI = "03";

  static String EVASET = "OK";
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Processor'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZAM_PY_TRAVEL_PROCESSOR as projection on ZAM_PY_TRAVEL
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    AgencyName,
    CustomerName,
    OverallStatusText,
    IconColor,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_AM_PY_VE_CALC'
   @EndUserText.label: 'CO2 Tax'
   virtual CO2Tax : abap.int4,
   @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_AM_PY_VE_CALC'
   @EndUserText.label: 'Week Day'
   virtual dayOfTheFlight : abap.char( 9 ),
    /* Associations */
    _Agency,
    _Booking : redirected to composition child ZAM_PY_BOOKING_PROCESSOR,
    _Attachment: redirected to composition child ZAM_PY_ATTACH_PROCESSOR,
    _Currency,
    _Customer,
    _OverallStatus
}

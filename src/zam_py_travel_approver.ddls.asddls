@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Processor'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZAM_PY_TRAVEL_APPROVER as projection on ZAM_PY_TRAVEL
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
      _Agency,
    _Booking : redirected to composition child ZAM_PY_BOOKING_APPROVER,
    _Currency,
    _Customer,
    _OverallStatus
}

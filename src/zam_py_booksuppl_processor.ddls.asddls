@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Processor'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZAM_PY_BOOKSUPPL_PROCESSOR as projection on ZAM_PY_BOOKSUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking : redirected to parent ZAM_PY_BOOKING_PROCESSOR,
    _Product,
    _SupplementText,
    _Travel : redirected to ZAM_PY_TRAVEL_PROCESSOR
}

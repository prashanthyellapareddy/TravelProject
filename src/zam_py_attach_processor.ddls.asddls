@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Processor'
@Metadata.allowExtensions: true
define view entity ZAM_PY_ATTACH_PROCESSOR as projection on ZAM_PY_M_ATTACH
{
  key TravelId,
   key Id,
   Memo,
   Attachment,
   Filetype,
   Filename,
   LastChangedAt,
   LocalCreatedAt,
   LocalCreatedBy,
   LocalLastChangedAt,
   LocalLastChangedBy,
    _Travel :  redirected to parent ZAM_PY_TRAVEL_PROCESSOR
}

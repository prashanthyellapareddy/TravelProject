@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Child entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZAM_PY_BOOKING as select from /dmo/booking_m
composition[1..*] of ZAM_PY_BOOKSUPPL as _BookingSuppl
association to parent ZAM_PY_TRAVEL as _Travel
   on $projection.TravelId = _Travel.TravelId
association[1..1] to /DMO/I_Customer as _Customer on
   $projection.CustomerId = _Customer.CustomerID
association[1..1] to /DMO/I_Carrier as _Carrier on
   $projection.CarrierId = _Carrier.AirlineID
association[1..1] to /DMO/I_Connection as _Connection on
   $projection.CarrierId = _Connection.AirlineID and
   $projection.ConnectionId = _Connection.ConnectionID
association[1..1] to /DMO/I_Booking_Status_VH as _BookingStatus on
   $projection.BookingStatus = _BookingStatus.BookingStatus 
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Customer',   entity.element: 'CustomerID'     }]
    customer_id as CustomerId,
    @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Carrier',   entity.element: 'AirlineID'     }]
    carrier_id as CarrierId,
    @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Connection',   entity.element: 'ConnectionID'  ,
                                                                        additionalBinding: [{  localElement: 'CarrierId', element: 'AirlineId' }]   }]
    
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    @Consumption.valueHelpDefinition: [{  entity.name: 'I_Currency', entity.element: 'Currency'   }]
    currency_code as CurrencyCode,
    booking_status as BookingStatus,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
      _Customer,
   _Carrier,
   _Connection,
   _BookingStatus,
   _Travel,
   _BookingSuppl
}

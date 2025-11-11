@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define root view entity ZAM_PY_TRAVEL
  as select from /dmo/travel_m
  composition[1..*] of ZAM_PY_BOOKING      as _Booking
  composition[0..*] of ZAM_PY_M_ATTACH as _Attachment
  association [1]    to /DMO/I_Agency     as _Agency     on $projection.AgencyId = _Agency.AgencyID
  association [1]    to /DMO/I_Customer as _Customer   on $projection.CustomerId = _Customer.CustomerID
  association [1]    to I_Currency               as _Currency   on $projection.CurrencyCode = _Currency.Currency
  association [1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus
{
      @ObjectModel.text.element: [ 'Description' ]
      key travel_id  as TravelId,

      @ObjectModel.text.element: [ 'AgencyName' ]
    //  @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Agency',   entity.element: 'AgencyID'     }]
       @Consumption.valueHelpDefinition: [{  entity.name: 'ZCAM_PY_AGENCY_ES5',   entity.element: 'Agency_Id'     }]
      agency_id          as AgencyId,
      _Agency.Name  as AgencyName,

      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Customer',   entity.element: 'CustomerID'   }]
      customer_id        as CustomerId,
      _Customer.LastName as CustomerName,

      begin_date        as BeginDate,
      end_date           as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee       as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price        as TotalPrice,
      
      @Consumption.valueHelpDefinition: [{  entity.name: 'I_Currency', entity.element: 'Currency'   }]
      currency_code      as CurrencyCode,
      description        as Description,
      
      @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Overall_Status_VH', entity.element: 'OverallStatus'   }]
      --@ObjectModel.foreignKey.association: '_OverallStatus'
       @ObjectModel.text.element: [ 'OverallStatusText' ]
      overall_status     as OverallStatus,
      @Semantics.user.createdBy: true
      created_by         as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at         as CreatedAt,
     @Semantics.user.lastChangedBy: true
      last_changed_by    as LastChangedBy,
       @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at    as LastChangedAt,
       case overall_status
       when 'O' then 'Open'
       when 'A' then 'Approved'
       when 'X' then 'Rejected'
       when 'R' then 'Released'
       else 'Unknown'
       end as OverallStatusText,
   case overall_status
       when 'O' then 2
       when 'A' then 3
       when 'X' then 1
       when 'R' then 3
       else 1
       end as IconColor,
     
      
      _Booking,
      _Agency,
      _Customer,
      _Currency,
      _OverallStatus,
      _Attachment
      -- _association_name // Make association public
}

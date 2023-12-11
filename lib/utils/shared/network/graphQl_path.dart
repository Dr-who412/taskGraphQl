class GraphQlPath{
  static String login='''
  mutation Login(\$username: String!, \$password: String!) {
              login(input: {username: \$username, password: \$password}) {
                token
              }
            }
  ''';
  static String createPickUp="""
      mutation SavePickup(\$customerId: Int!, \$timeFrom: Time!, \$timeTo: Time!, \$shipmentsCount: Int!, \$notes: String!, \$branchId: Int!, \$transactionTypeId: Int!) {
              savePickup(input: {
                customerId: \$customerId,
                timeFrom: \$timeFrom,
                timeTo: \$timeTo,
                shipmentsCount: \$shipmentsCount,
                notes: \$notes,
                branchId: \$branchId,
                transactionTypeId: \$transactionTypeId,
              }) {
                id
                code
                date
                timeFrom
                timeTo
                notes
                deliveryAgentNotes
                shipmentsCount
                deliveryCommission
              }
            }
  """;
}
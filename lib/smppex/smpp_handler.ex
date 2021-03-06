defprotocol SMPPEX.SMPPHandler do

  alias SMPPEX.Protocol, as: SMPP
  alias SMPPEX.Pdu, as: Pdu

  @type handler :: any
  @type ref :: any
  @type socket :: port
  @type transport :: module
  @type protocol :: pid

  @type init_error :: any
  @type init_reult :: {:ok, handler} | init_error

  @spec init(handler, ref, socket, transport, protocol) :: init_error
  def init(handler, ref, socket, transport, protocol)

  @spec after_init(handler) :: any
  def after_init(handler)

  @spec handle_parse_error(handler, SMPP.error) :: any
  def handle_parse_error(handler, error)

  @type handle_pdu_result :: {:ok, handler} | {:ok, handler, [Pdu.t]} | {:stop, handler, [Pdu.t]} | :stop

  @spec handle_pdu(handler, SMPP.pdu_parse_result) :: handle_pdu_result
  def handle_pdu(handler, parse_result)

  @spec handle_socket_closed(handler) :: any
  def handle_socket_closed(handler)

  @spec handle_socket_error(handler, any) :: any
  def handle_socket_error(handler, reason)

  @spec handle_stop(handler) :: any
  def handle_stop(handler)

  @type send_pdu_result :: :ok | {:error, any}

  @spec handle_send_pdu_result(handler, Pdu.t, send_pdu_result) :: handler
  def handle_send_pdu_result(handler, pdu, send_pdu_result)

end

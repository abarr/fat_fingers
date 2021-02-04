defmodule FatFingersWeb.PageLive do
  use FatFingersWeb, :live_view

  alias FatFingers.Devices

  @impl true
  def mount(_params, _session, socket) do
    socket =
      assign(socket,
      device: nil,
      matches: [],
      value: "_"
      )
    {:ok, socket}
  end

  @impl true
  def handle_event("search", %{ "device" => device }, socket) do
    socket = assign(socket, matches: Devices.suggest(device))
    {:noreply, socket}
  end

  @impl true
  def handle_event("select_match", %{ "match" => match}, socket) do
    socket = assign(socket, device: match, matches: [])
    {:noreply, socket}
  end

  @impl true
  def handle_event("number", %{ "number" => number}, socket) do
    cond do
      is_nil(socket.assigns.device) -> {:noreply, socket}
      true ->
        case socket.assigns.value do
          "_" ->
            socket = assign(socket, value: number)
            {:noreply, socket}
          _ ->
            socket = assign(socket, value: socket.assigns.value <> number)
            {:noreply, socket}
        end
    end
  end

  @impl true
  def handle_event("clear", _, socket) do
    socket = assign(socket, value: "_")
    {:noreply, socket}
  end

end

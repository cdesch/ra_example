# RaExample

## Start

    # Terminal 1
    ERL_FLAGS="-name count1@127.0.0.1 -setcookie cookie" NODES="count2@127.0.0.1,count3@127.0.0.1" iex -S mix
    # Terminal 2
    ERL_FLAGS="-name count2@127.0.0.1 -setcookie cookie" NODES="count1@127.0.0.1,count3@127.0.0.1" iex -S mix
    # Terminal 3
    ERL_FLAGS="-name count3@127.0.0.1 -setcookie cookie" NODES="count1@127.0.0.1,count2@127.0.0.1" iex -S mix

## Rabbit MQ Ra

Run on Each Node

    node1 = :"count1@127.0.0.1"
    node2 = :"count2@127.0.0.1"
    node3 = :"count3@127.0.0.1"
    nodes = [node1, node2, node3]
    cluster_name = :quick_start
    server_ids = Enum.map(nodes, fn(x) -> {:quick_start, x} end)

Start on node 1

    :ra.start()

Start on node 2

    :ra.start()

Start on node 3

    :ra.start()

Start Cluster On Node 2

    state_machine = {:simple, &:erlang.+/2, 0}

    {:ok, servers_started, _servers_not_started} =  :ra.start_cluster(:default, cluster_name, state_machine, server_ids)

Add to state machine

    Add 5 to satemachine
    {:ok, state_machine_result, leader_id} = :ra.process_command(hd(servers_started), 5)

    Add 2 to Statemachine
    {:ok, result, _} = :ra.process_command(hd(servers_started), 2)


    {ok, 12, LeaderId1} = ra:process_command(LeaderId, 7).

    {:ok, new_result, leader_id_1} = :ra.process_command(leader_id, 7)

Join Cluster

    Add member

    {:ok, res, _r} = :ra.add_member({cluster_name, node1}, {cluster_name, node2}),

    Start the server

    :ok = :ra.start_server(:default, cluster_name, {cluster_name, node2}, state_machine, [{cluster_name, node1}])


Check Members

    :ra.members({cluster_name, node()})    
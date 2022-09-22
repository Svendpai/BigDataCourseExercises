while True:

    # input
    input_string = str(input())

    # output
    from kafka import KafkaProducer
    import time
    producer = KafkaProducer(bootstrap_servers='kafka:9092')

    producer.send('foo', value=(input_string.encode('utf-8')))

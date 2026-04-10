# Regla de EventBridge para detectar eventos importantes en servicios 
resource "aws_cloudwatch_event_rule" "health_event_rule" {
  name        = "HealthServicesAWS" //Nombre de la regla en EventBridge
  description = "Regla para capturar eventos de AWS Health Service relacionados con IAM, EC2, ELB, EFS, RDS, SNS, CloudWatch" #Descripción de la regla
  event_pattern = jsonencode({ //Codigo JSON de la regla
    "source": ["aws.health"], //Servicio de AWS de origen sobre la que detectar los eventos (AWS Personal Health Dashboard)
    "region": ["eu-west-1"], //Región donde se despliegan los servicios
    "detail-type": ["AWS Health Event"],
    "detail": {
      "eventTypeCategory": [ //Tipos de eventos a detectar
        "issue", //Detecta eventos sobre incidencias generales en los servicios definidos
        "accountNotification", //Detecta eventos importantes sobre acciones importantes a realizar en la cuenta
        "scheduledChange" //Detecta eventos sobre cambios programados en los servicios definidos
      ],
      "service": [ //Servicios desplegados en nuestra infraestructura sobre los que se desea detectar los eventos
        "IAM",
        "CLOUDWATCH"
      ]
    }
  })
}


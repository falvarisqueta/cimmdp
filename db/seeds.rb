VisitType.where(id:1, name: 'Screening').first_or_create
VisitType.where(id:2, name: 'Rando').first_or_create
VisitType.where(id:3, name: 'Phone').first_or_create
VisitType.where(id:4, name: 'Presence').first_or_create
PendingActivity.where(id:1, name: 'Labs Evaluation').first_or_create
PendingActivity.where(id:2, name: 'Serious Adverse Event Report').first_or_create
PendingActivity.where(id:3, name: 'Non Serious Adverse Event Report').first_or_create
PendingActivity.where(id:4, name: 'Special Interes Adverse Event').first_or_create
PendingActivity.where(id:5, name: 'Outcome').first_or_create
PendingActivity.where(id:6, name: 'Adjudication Package').first_or_create

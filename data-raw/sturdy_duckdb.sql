CREATE OR REPLACE TABLE "study" (
  "id" UUID PRIMARY KEY,
  "name" TEXT,
  "description" TEXT,
  "type" TEXT CHECK(type IN ('journal', 'technical'))
);

CREATE OR REPLACE TABLE "question" (
  "id" UUID PRIMARY KEY,
  "statement" TEXT,
  "type" TEXT
);

CREATE OR REPLACE TABLE "hypothesis" (
  "id" UUID PRIMARY KEY,
  "statement" TEXT,
  "type" TEXT
);

CREATE OR REPLACE TABLE "design" (
  "id" UUID PRIMARY KEY,
  "description" TEXT,
  "type" TEXT
);

CREATE OR REPLACE TABLE "treatment" (
  "id" UUID PRIMARY KEY,
  "name" TEXT,
  "type" TEXT
);

CREATE OR REPLACE TABLE "observation" (
  "id" UUID PRIMARY KEY,
  "type" TEXT,
  "data" TEXT
);

CREATE OR REPLACE TABLE "finding" (
  "id" UUID PRIMARY KEY,
  "statement" TEXT,
  "type"TEXT
);

CREATE OR REPLACE TABLE "conclusion" (
  "id" UUID PRIMARY KEY,
  "statement" TEXT,
  "type" TEXT
);

CREATE OR REPLACE TABLE "assessment" (
  "id" UUID PRIMARY KEY,
  "statement" TEXT,
  "type" TEXT
);

CREATE OR REPLACE TABLE "project" (
  "id" UUID PRIMARY KEY,
  "name" TEXT,
  "description" TEXT,
  "type" TEXT
);

CREATE OR REPLACE TABLE "objective" (
  "id" UUID PRIMARY KEY,
  "statement" TEXT,
  "type" TEXT
);

CREATE OR REPLACE TABLE "feature" (
  "id" UUID PRIMARY KEY,
  "type" TEXT,
  "sub_type" TEXT
);

CREATE OR REPLACE TABLE "criteria" (
  "id" UUID PRIMARY KEY,
  "statement" TEXT,
  "type" TEXT
);

CREATE OR REPLACE TABLE "monitoring_event" (
  "id" UUID PRIMARY KEY,
  "date" date,
  "type" TEXT
);

CREATE OR REPLACE TABLE "study_question" (
  "id" UUID PRIMARY KEY,
  "study_id" UUID,
  "relation" TEXT,
  "question_id" UUID,
  FOREIGN KEY ("study_id") REFERENCES "study" ("id"),
  FOREIGN KEY ("question_id") REFERENCES "question" ("id")
);

CREATE OR REPLACE TABLE "question_hypothesis" (
  "id" UUID PRIMARY KEY,
  "question_id" UUID,
  "relation" TEXT,
  "hypothesis_id" UUID,
  FOREIGN KEY ("question_id") REFERENCES "question" ("id"),
  FOREIGN KEY ("hypothesis_id") REFERENCES "hypothesis" ("id")
);

CREATE OR REPLACE TABLE "hypothesis_design" (
  "id" UUID PRIMARY KEY,
  "hypothesis_id" UUID,
  "relation" TEXT,
  "design_id" UUID,
  FOREIGN KEY ("hypothesis_id") REFERENCES "hypothesis" ("id"),
  FOREIGN KEY ("design_id") REFERENCES "design" ("id")
);

CREATE OR REPLACE TABLE "design_treatment" (
  "id" UUID PRIMARY KEY,
  "design_id" UUID,
  "relation" TEXT,
  "treatment_id" UUID,
  FOREIGN KEY ("design_id") REFERENCES "design" ("id"),
  FOREIGN KEY ("treatment_id") REFERENCES "treatment" ("id")
);

CREATE OR REPLACE TABLE "project_objective" (
  "id" UUID PRIMARY KEY,
  "project_id" UUID,
  "relation" TEXT,
  "objective_id" UUID,
  FOREIGN KEY ("project_id") REFERENCES "project" ("id"),
  FOREIGN KEY ("objective_id") REFERENCES "objective" ("id")
);

CREATE OR REPLACE TABLE "project_feature" (
  "id" UUID PRIMARY KEY,
  "project_id" UUID,
  "relation" TEXT,
  "feature_id" UUID,
  FOREIGN KEY ("project_id") REFERENCES "project" ("id"),
  FOREIGN KEY ("feature_id") REFERENCES "feature" ("id")
);

CREATE OR REPLACE TABLE "objective_criteria" (
  "id" UUID PRIMARY KEY,
  "objective_id" UUID,
  "relation" TEXT,
  "criteria_id" UUID,
  FOREIGN KEY ("objective_id") REFERENCES "objective" ("id"),
  FOREIGN KEY ("criteria_id") REFERENCES "criteria" ("id")
);

CREATE OR REPLACE TABLE "project_monitoring_event" (
  "id" UUID PRIMARY KEY,
  "project_id" UUID,
  "relation" TEXT,
  "monitoring_event_id" UUID,
  FOREIGN KEY ("project_id") REFERENCES "project" ("id"),
  FOREIGN KEY ("monitoring_event_id") REFERENCES "monitoring_event" ("id")
);

CREATE OR REPLACE TABLE "treatment_feature" (
  "id" UUID PRIMARY KEY,
  "treatment_id" UUID,
  "relation" TEXT,
  "feature_id" UUID,
  FOREIGN KEY ("treatment_id") REFERENCES "treatment" ("id"),
  FOREIGN KEY ("feature_id") REFERENCES "feature" ("id")
);

CREATE OR REPLACE TABLE "monitoring_event_observation" (
  "id" UUID PRIMARY KEY,
  "monitoring_event_id" UUID,
  "relation" TEXT,
  "observation_id" UUID,
  FOREIGN KEY ("monitoring_event_id") REFERENCES "monitoring_event" ("id"),
  FOREIGN KEY ("observation_id") REFERENCES "observation" ("id")
);

CREATE OR REPLACE TABLE "treatment_observation" (
  "id" UUID PRIMARY KEY,
  "treatment_id" UUID,
  "relation" TEXT,
  "observation_id" UUID,
  FOREIGN KEY ("treatment_id") REFERENCES "treatment" ("id"),
  FOREIGN KEY ("observation_id") REFERENCES "observation" ("id")
);

CREATE OR REPLACE TABLE "observation_finding" (
  "id" UUID PRIMARY KEY,
  "observation_id" UUID,
  "relation" TEXT,
  "finding_id" UUID,
  FOREIGN KEY ("observation_id") REFERENCES "observation" ("id"),
  FOREIGN KEY ("finding_id") REFERENCES "finding" ("id")
);

CREATE OR REPLACE TABLE "finding_conclusion" (
  "id" UUID PRIMARY KEY,
  "finding_id" UUID,
  "relation" TEXT,
  "conclusion_id" UUID,
  FOREIGN KEY ("finding_id") REFERENCES "finding" ("id"),
  FOREIGN KEY ("conclusion_id") REFERENCES "conclusion" ("id")
);

CREATE OR REPLACE TABLE "assessment_conclusion" (
  "id" UUID PRIMARY KEY,
  "assessment_id" UUID,
  "relation" TEXT,
  "conclusion_id" UUID,
  FOREIGN KEY ("assessment_id") REFERENCES "assessment" ("id"),
  FOREIGN KEY ("conclusion_id") REFERENCES "conclusion" ("id")
);

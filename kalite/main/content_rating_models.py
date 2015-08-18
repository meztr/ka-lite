from django.conf import settings
from django.db import models

from kalite.facility.models import FacilityUser

from securesync.models import DeferredCountSyncedModel

class ContentRating(DeferredCountSyncedModel):

    minversion = "0.15.0"

    class Meta:
        unique_together = ("content_kind", "content_id", "user")

    # Maintain info on content type -- could be video, exercise, etc, but we should be able to uniquely id it
    content_kind = models.CharField(max_length=100, db_index=True, blank=False)
    content_id = models.CharField(max_length=100, db_index=True, blank=False)
    content_source = models.CharField(max_length=100, db_index=True, default=settings.CHANNEL)

    user = models.ForeignKey(FacilityUser, blank=False)
    quality = models.IntegerField(blank=False, default=0)
    difficulty = models.IntegerField(blank=False, default=0)
    text = models.TextField(blank=True)

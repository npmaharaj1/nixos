{ config, lib, pkgs, ... }:

{
    programs.freetube = {
        enable = true;

        settings = {
            disableSmoothScrolling = true;
            generalAutoLoadMorePaginatedItemsEnabled = true;
            quickBookmarkTargetPlaylistId = "favorites";
            proxyVideos = true;
            defaultQuality = "1440";
            useRssFeeds = true;
            unsubscriptionPopupStatus = true;
            hideTrendingVideos = true;
            hidePopularVideos = true;
            useSponsorBlock = true;
            useDeArrowTitles = true;
            useDeArrowThumbnails = true;
            sponsorBlockShowSkippedToast = false;
        };
    };
}
